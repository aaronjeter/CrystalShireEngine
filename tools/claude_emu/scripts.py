import subprocess, os, tempfile
CSE = os.environ.get("CSE", "/root/cse")
RGB = "/root/rgbds"
BASE = 0x3F90  # free ROM0 space at the end of Home ($3f83-$3fff as of Oct 20, 2026); check pokecrystal.map if Home grows


def assemble(body, org):
    src = f'SECTION "t", ROM0[${org:04X}]\n' + body + "\n"
    d = tempfile.mkdtemp()
    a, o, b = f"{d}/t.asm", f"{d}/t.o", f"{d}/t.gbc"
    open(a, "w").write(src)
    subprocess.run([f"{RGB}/rgbasm", "-Q8", "-P", "includes.asm", "-o", o, a], cwd=CSE, check=True)
    subprocess.run([f"{RGB}/rgblink", "-x", "-o", b, o], cwd=CSE, check=True)
    data = open(b, "rb").read()
    return data[org:]


def party_script(species, level, moves, partymon1):
    lines = [f"\tgivepoke {species}, {level}"]
    for i, m in enumerate(moves):
        lines.append(f"\tgivepokemove {m}, ${partymon1:04X}, {i}")
    lines.append("\tend")
    return "\n".join(lines)


def battle_script(species, level):
    return f"\tloadwildmon {species}, {level}\n\tstartbattle\n\treloadmapafterbattle\n\tend"
