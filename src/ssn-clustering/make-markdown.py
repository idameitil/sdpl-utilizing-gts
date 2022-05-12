
timestamp = '2205111239'

metadata_file = open(f"data/wzy/ssn-clusterings/clustering/{timestamp}/metadata.txt")
metadata = metadata_file.read()
metadata_file.close()

info_file = open(f"data/wzy/ssn-clusterings/clustering/{timestamp}/info.txt")
info = info_file.read()
info_file.close()

outfile = open(f"data/wzy/ssn-clusterings/clustering/{timestamp}/report.md", "w")

markdown_string = f"""
# Report of ssn-clustering run {timestamp}

## Metadata
{metadata}

## Info
{info}

## Clusters

"""

outfile.write(markdown_string)