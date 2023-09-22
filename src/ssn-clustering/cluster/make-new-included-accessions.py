

with open('data/wzy/ssn-clusterings/2210171613/included_accessions.txt') as f:
    accessions_old = f.read().splitlines()

accessions_remove = []
with open('data/wzy/accessions-remove') as infile:
    for line in infile:
        if not line.startswith('#'):
            accessions_remove.append(line.strip())

with open("data/wzy/included_accessions_new", 'w') as outfile:
    for accession in accessions_old:
        if accession not in accessions_remove:
            outfile.write(f"{accession}\n")