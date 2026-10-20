# render a whole map from emulator memory: python3 rmap.py MAP blkfile width out [x y]
from harness import H, warp_script, LIB
import ctypes as C, sys, re
from PIL import Image
mp,blk,w,out=sys.argv[1],sys.argv[2],int(sys.argv[3]),sys.argv[4]
x,y=(int(sys.argv[5]),int(sys.argv[6])) if len(sys.argv)>6 else (1,1)
g=H('fol.gbc',None,'fol.sym'); g.load('ow_fol.state')
g.run_script(warp_script(mp,x,y)); g.frames(200)
def da(i):
    size=C.c_size_t(); bank=C.c_uint16()
    p=LIB.GB_get_direct_access(g.gb,i,C.byref(size),C.byref(bank))
    return bytes((C.c_uint8*size.value).from_address(p))
syms={}
for l in open('fol.sym'):
    m=re.match(r'^([0-9a-f]{2}):([0-9a-f]{4}) (\w+)$',l.strip())
    if m: syms[m.group(3)]=(int(m.group(1),16),int(m.group(2),16))
wram=da(1); vram=da(3); bgp=da(8)
def wr(name,n):
    b,a=syms[name]; off=b*0x1000+(a-0xd000) if a>=0xd000 else a-0xc000
    return wram[off:off+n]
mt=wr('wDecompressedMetatiles',4096); at=wr('wDecompressedAttributes',4096)
pals=[[((v&31)*8,((v>>5)&31)*8,((v>>10)&31)*8) for v in [bgp[p*8+k*2]|bgp[p*8+k*2+1]<<8 for k in range(4)]] for p in range(8)]
def tile(idx,attr):
    bank=(attr>>3)&1
    addr=(0x1000+idx*16) if idx<128 else (0x800+(idx-128)*16)
    d=vram[bank*0x2000+addr:bank*0x2000+addr+16]
    pal=pals[attr&7]; im=Image.new('RGB',(8,8))
    for r in range(8):
        rr=7-r if attr&0x40 else r
        lo,hi=d[rr*2],d[rr*2+1]
        for c in range(8):
            cc=7-c if attr&0x20 else c
            v=((lo>>(7-cc))&1)|(((hi>>(7-cc))&1)<<1)
            im.putpixel((c,r),pal[v])
    return im
blocks=open(blk,'rb').read(); h=len(blocks)//w
img=Image.new('RGB',(w*32,h*32))
from PIL import ImageDraw
for by in range(h):
    for bx in range(w):
        b=blocks[by*w+bx]
        for t in range(16):
            img.paste(tile(mt[b*16+t],at[b*16+t]),(bx*32+(t%4)*8,by*32+(t//4)*8))
img=img.resize((w*64,h*64),Image.NEAREST)
d=ImageDraw.Draw(img)
for by in range(h):
    for bx in range(w):
        d.text((bx*64+2,by*64+2),'%02x'%blocks[by*w+bx],fill=(255,255,0))
img.save(out)
print('LCDC',hex(g.rd(0xff40)))
g.shot('rmap_screen.png',2)
