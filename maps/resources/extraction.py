import os

files = ["\postes.csv", "\\brigardes.csv"]

for file in files:
    fic = open(os.path.dirname(__file__) + file, "r", encoding="utf-8")
    lignes = fic.readlines()
    lat = []
    lon = []
    villes = []
    for ligne in lignes[1::]:
        ligne = ligne.strip("\n\r")
        lat.append(float(ligne.split(",")[0]))
        lon.append(float(ligne.split(",")[1]))
        villes.append(ligne.split(",")[2])
    print(lat)
    print(lon)
    print(villes, end="\n\n")
    fic.close()
