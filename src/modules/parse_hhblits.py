def parse_hhblits_output(hhr_filename):
    hits = {}
    with open(hhr_filename, 'r') as infile:
        flag = False
        first = True
        for line in infile:
            if line.startswith('Query'):
                query_acc = line.split()[1]
            if flag:
                if line.strip() == '':
                    flag = False
                    continue
                hit_accession = line[4:34].split()[0]
                evalue = float(line[41:48].strip())
                score = float(line[58:63].strip())
                # hits[hit_accession] = {'evalue': evalue, 'score': score}
                if not first:
                    hits[hit_accession] = score
                first = False
            elif line.startswith(' No Hit'):
                flag = True
    return query_acc, hits