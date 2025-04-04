# Load the geodata library
library(geodata)
library(prettymapr)


# Load administrative boundaries for Côte d'Ivoire (level 3: sub-prefectures)
adm_civ <- geodata::gadm(country = "CIV", level = 3, path = "./maps")



# Plot the base map of Côte d'Ivoire
plot(adm_civ, lwd = 0.5, border = "black", col = "white", bg = "white", box = FALSE, axes=FALSE,
     main = "Gendarmerie coverage in Côte d'Ivoire from 1932 to 1950")


# Coordinates (latitude and longitude) of gendarmerie brigades
lat1 <- c(5.323212, 7.683333, 5.933333, 7.956944, 5.356792, 8.140556, 5.13652, 9.6, 5.316667, 6.65, 9.416667)
lon1 <- c(-4.023689, -5.016667, -4.216667, -6.668056, -6.749399, -5.102222, -5.026048, -5.2, -4.033333, -4.7, -5.616667)
villes1 <- c("Plateau", "Bouaké", "Agboville", "Séguéla", "Sassandra", "Katiola", "Grand-Lahou", "Ferkessédougou",
             "Port d'Abidjan", "Dimbokro", "Korhogo")

# Coordinates of gendarmerie posts
lat2 <- c(6.133333, 7.41251, 8.047883, 9.416667, 6.65, 5.633333, 8.06, 6.58, 6.733333, 4.42295,
          6.383333, 7.16085, 5.833333, 5.260458, 7.296114)
lon2 <- c(-5.933333, -7.55383, -2.807864, -5.616667, -4.2, -4.083333, -6.19, -8.42, -3.483333, -7.3528,
          -5.416667, -5.234985, -5.366667, -3.964388, -4.013361)
villes2 <- c("Gagnoa", "Man", "Bondoukou", "Korhogo", "Bongouanou", "Azaguié", "Mankono", "Toulepleu",
             "Abengourou", "Tabou", "Oumé", "Tiébissou", "Divo", "Port-Bouet", "Ouéllé")

# Highlight the administrative areas where brigades are located
plot(adm_civ[adm_civ$NAME_3 %in% villes1, ], add = T, col = "blue", density = c(20, 20, 20), angle = c(45, -45, 45, -45))
box()

# Plot brigade locations as blue symbols
points(lon1, lat1, col = "blue", pch = 13, cex = 2, lwd = 2)

# Plot post locations as red symbols
points(lon2, lat2, col = "red", pch = 14, cex = 2, lwd = 2)

# Add labels for each city (brigades and posts), with position adjustments
text(c(lon1, lon2) + c(-0.4, rep(0, 15), +0.5, rep(0, 7), +0.5, 0),
     c(lat1, lat2) + c(0, 0.22, 0.22, -0.21, rep(0.22, 2), -0.23, 0.22, -0.23, 0.22, -0.21, rep(0.22, 3), -0.21, -0.21, 0, rep(0.22, 7), 0.05, 0.22),
     c(villes1, villes2), cex = 0.8)


# Add a legend for brigade and post markers
legend("bottom", pch = c(13, 14), legend = c("Gendarmerie Brigade", "Gendarmerie Post"),
       col = c("blue", "red"), cex = 1.2, box.lty = 0)


# Add a scale bar indicating 100 km
addscalebar(style = "bar", unit = "metric", pos = "topright")

# Add a northarrow
addnortharrow(pos = "bottomright", scale = 0.5)
