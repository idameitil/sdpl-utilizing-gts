import sys
from jinja2 import Environment, FileSystemLoader, select_autoescape
from common import SSNClusterData

def make_table(ssn_clustering_id):
    clustering_data = SSNClusterData(ssn_clustering_id)
    t = list(clustering_data.clusters)
    jinja_env = Environment(
        loader=FileSystemLoader("src/ssn-clustering/make-table"),
        autoescape=select_autoescape())
    

    html_jinja_template = jinja_env.get_template("table-template.html")

    output_content = html_jinja_template.render(cluster_groups='hola')

    with open('output.html', 'w') as output_file:
        output_file.write(output_content)

if __name__ == '__main__':
    make_table(sys.argv[1])