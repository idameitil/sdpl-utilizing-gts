class Ensemble:
	def __init__(self, name="Ensemblename"):
		self.elements = []
		self.name = name
	
	def push(self, data):
		self.elements.append(data)

	def pop(self):
		return self.elements.pop()

	def print(self):
		print(f"Ensemble {self.name} has {len(self.elements)} elements: {self.elements}\n")
