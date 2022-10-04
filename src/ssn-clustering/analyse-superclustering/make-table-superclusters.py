import sys
import numpy as np
import math
from jinja2 import Environment, FileSystemLoader, select_autoescape
sys.path.append('src/ssn-clustering/analyse-clustering')
from common import SSNClusterData

table_output_path = lambda clustering_id, superclustering_id: f"data/wzy/ssn-clusterings/{clustering_id}/superclusterings/{superclustering_id}/superclusters_table.html"

def make_table(ssn_clustering_id, superclustering_id):
    clustering_data = SSNClusterData(ssn_clustering_id, superclustering_id, load_clusters=False, calculate_conserved=False)
    superclusters = list(clustering_data.superclusters)
    supercluster_groups = np.array_split(superclusters, math.floor(len(superclusters)/10))
    clusters = list(clustering_data.clusters)
    jinja_env = Environment(
        loader=FileSystemLoader("src/ssn-clustering/analyse-superclustering/make-table"),
        autoescape=select_autoescape())

    html_jinja_template = jinja_env.get_template("superclusters-table-template.html")

    output_content = html_jinja_template.render(ssn_clustering_id=ssn_clustering_id, supercluster_groups=supercluster_groups, clusters=clusters)

    with open(table_output_path(ssn_clustering_id, superclustering_id), 'w') as output_file:
        output_file.write(output_content)

if __name__ == '__main__':
    make_table(sys.argv[1], sys.argv[2])