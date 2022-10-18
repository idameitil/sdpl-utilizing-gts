import sys
import numpy as np
import math
from jinja2 import Environment, FileSystemLoader, select_autoescape
from common import SSNClusterData

table_output_path = lambda clustering_id: f"data/wzy/ssn-clusterings/{clustering_id}/clusters_table.html"

def make_table(ssn_clustering_id):
    clustering_data = SSNClusterData(ssn_clustering_id, load_superclusters=False)
    clusters = list(clustering_data.clusters)
    cluster_groups = np.array_split(clusters, math.floor(len(clusters)/10))
    jinja_env = Environment(
        loader=FileSystemLoader("src/ssn-clustering/analyse-clustering/make-table"),
        autoescape=select_autoescape())

    html_jinja_template = jinja_env.get_template("table-template.html")

    output_content = html_jinja_template.render(ssn_clustering_id=ssn_clustering_id, cluster_groups=cluster_groups)

    with open(table_output_path(ssn_clustering_id), 'w') as output_file:
        output_file.write(output_content)

if __name__ == '__main__':
    make_table(sys.argv[1])