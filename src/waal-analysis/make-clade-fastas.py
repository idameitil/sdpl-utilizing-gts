from Bio import SeqIO
clade1_filename = "data/waal/clades/clade1"
clade2_filename = "data/waal/clades/clade2"
clade2_1_filename = "data/waal/clades/clade2-1"
clade2_2_filename = "data/waal/clades/clade2-2"

def read_clade(clade_filename):
    clade_accessions = set()
    with open(clade_filename) as infile:
        for line in infile:
            clade_accessions.add(line.strip().replace(' ', '_'))
    return clade_accessions

def write_output(clade, fasta_dict):
    output_filename = f"data/waal/clades/clade{clade}.fasta"
    with open(output_filename, 'w') as outfile:
        for acc in fasta_dict:
            outfile.write(f">{acc}\n{fasta_dict[acc]}\n")
    return

clade1_accessions = read_clade(clade1_filename)
clade2_accessions = read_clade(clade2_filename)
clade2_1_accessions = read_clade(clade2_1_filename)
clade2_2_accessions = read_clade(clade2_2_filename)
clade1_acc2seq = {}
clade2_acc2seq = {}
clade2_1_acc2seq = {}
clade2_2_acc2seq = {}
for entry in SeqIO.parse("data/waal/MSA-logo/seeds-and-hits.fasta", format='fasta'):
    if entry.id in clade1_accessions:
        clade1_acc2seq[entry.id] = entry.seq
    elif entry.id in clade2_accessions:
        clade2_acc2seq[entry.id] = entry.seq
        if entry.id in clade2_1_accessions:
            clade2_1_acc2seq[entry.id] = entry.seq
        if entry.id in clade2_2_accessions:
            clade2_2_acc2seq[entry.id] = entry.seq
    else:
        print(entry.id)

write_output("1", clade1_acc2seq)
write_output("2", clade2_acc2seq)
write_output("2-1", clade2_1_acc2seq)
write_output("2-2", clade2_2_acc2seq)