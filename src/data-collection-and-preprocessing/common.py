from ete3 import NCBITaxa
import pandas as pd

ncbi = NCBITaxa()
def get_taxon(taxid, rank):
    try:
        lineage = ncbi.get_lineage(taxid)
        lineage2ranks = ncbi.get_rank(lineage)
        ranks2lineage = dict((rank, taxid) for (taxid, rank) in lineage2ranks.items())
        taxon = ncbi.get_taxid_translator([ranks2lineage[rank]])[ranks2lineage[rank]]
    except:
        taxon = 'NA'
    return taxon

csdb_df = pd.read_csv("data/csdb/CSDB_slice_for_Ida.txt",
                      dtype=object, sep = '\t')

def get_desired_sugars_df(species, serotypes, ids, forced_sugars):
    desired_sugars = []
    row_ids_done = []
    banned_sugars = ['911', '22678']
    for specie, serotype, id, forced_sugar in zip(species, serotypes, ids, forced_sugars):
        if pd.isnull(serotype):
            continue
        if not pd.isnull(forced_sugar):
            if forced_sugar == 'no_sugar':
                pass
            else:
                csdb_entries = csdb_df[(csdb_df.CSDB_record_ID == forced_sugar)]
                if forced_sugar not in row_ids_done:
                    desired_sugars.append([id] + list(csdb_entries.iloc[0]))
                    row_ids_done.append(forced_sugar)
        else:
            csdb_entries = csdb_df[(csdb_df.Taxonomic_name == specie) & (csdb_df.Strain_or_Serogroup == serotype)]
            if len(csdb_entries) > 0:
                record_id = csdb_entries['CSDB_record_ID'].iloc[0]
                if id not in row_ids_done and record_id not in banned_sugars:
                    desired_sugars.append([id] + list(csdb_entries.iloc[0]))
                    row_ids_done.append(id)
    desired_sugars_df = pd.DataFrame(desired_sugars, columns=['id'] + list(csdb_df.columns))
    desired_sugars_df.drop(['Taxonomic_name', 'Strain_or_Serogroup'], axis = 1, inplace = True)
    return desired_sugars_df