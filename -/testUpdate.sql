UPDATE ST_BAREAN
JOIN ST_BAREAN_TEMP ON ST_BAREAN.ART=ST_BAREAN_TEMP.ART
JOIN ST_ARTICULO ON ST_BAREAN_TEMP.ART=ST_ARTICULO.ID
SET ST_BAREAN.EAN=ST_BAREAN_TEMP.EAN WHERE ST_BAREAN.ART=ST_BAREAN_TEMP.ART;