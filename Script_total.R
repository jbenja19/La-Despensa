###################PRUEBA DE CONOCIMIENTOS####################
###################  PACÍFICO SEGUROS     ####################
### NOMBRE: Jesua Benjamín Huamaní Quiroz
### Fecha de creación: 06/08/2025
### Última modificación: 13/08/2025

#############################################################
#R 
#Pregunta: 1

#Asignamos un directorio de trabajo

setwd("C:\\Users\\jesua\\OneDrive\\Escritorio\\Proyectos\\Evaluación Practicante-pacíf\\Practicante\\2. R\\")

#llammos los paquetes

install.packages("writexl")
install.packages("lubridate")
library(readxl)
library(dplyr)
library(readr)
library(writexl)
library("lubridate")

#1.Importar el Excel de Calendario


#Buscamos la ruta de nuestro archivo a importar

file.choose()

#Asignamos la dirección a una ruta encontrada

df_c <- "Calendario.xlsx"
#Exploración de hojas
excel_sheets(df_c)

#Visuaalizamos los datos
df_c1 <- read_excel("Calendario.xlsx",
                    sheet = "Calendario")

glimpse(df_c1)


#Visualizamos las variables
names(df_c1)

#Verificamos que la columna sea tipo fecha
class(df_c1$Fecha) #Resulta ser tipo POSIXt que es tipo fecha

#Cargamos los paquetes que nos permiten trabajar con fechas



#Añadimos las columnas requeridas

df_c1 <- df_c1 %>%
  mutate(
    Fecha,
    Nro_Mes = month(Fecha),
    Nombre_Mes = month(Fecha, label = TRUE, abbr = FALSE),
    Año = year(Fecha)
  )
#Exportamos los resultados

write_xlsx(df_c1, "Calendario_final.xlsx")

#############################################################
#R 
#Pregunta: 2

#Asignamos la dirección a una ruta encontrada

df_clt <- "Cliente.xlsx"

#Exploración de hojas

excel_sheets(df_clt)

#Visualizamos los datos

df_clt1 <- read_excel("Cliente.xlsx",
                      sheet = "Clientes1")

df_clt2 <- read_excel("Cliente.xlsx",
                      sheet = "Clientes2")

df_clt3 <- read_excel("Cliente.xlsx",
                      sheet = "Clientes3")

#Generamos el merge con toda la infomación de cada hoja

df_total_clt <- bind_cols(df_clt1,df_clt2,df_clt3) #bind_cols es de dplyr

#Exloramos todas las variables de df_total_clt

names(df_total_clt)

#Seleccionamos estratégicamente solo las columnas que necesitamos

df_total_clt <- df_total_clt %>%
  select(IdCliente...1, NombreCli, FlagCarro, Income ) %>%
  #Además colocamos el nombre adecuado a la primera columna
  rename(Id_Cliente = IdCliente...1)

#Exportamos los resultados

write_xlsx(df_total_clt, "Cliente_final.xlsx")


#############################################################
#R 
#Pregunta : 3


#Importamos el archivo
#NOTA: al momento de importar faltaba un encabezado y por lo tanto la tabla se importaba de
#de manera errónea , por lo que se tuvo que modificar el archivo csv manualmente antes de importalo
#Lo que se hizo fue añadir el punto y coma que era el separador de columnas en la parte de los encabezados
#De este modo se solucionó el problema


df_T<- read.csv2("Territorio.csv")#se usa csv2 porque las columnas estan separadas por ";" que es el formato de latam/europa


#Seleccionamos las columnas 

df_T <- df_T %>%
  select(IdTerritorio, Lat, Lon, Place)


#Exportamos los resultados

write.csv(df_T, "Territorio_final.csv")

#############################################################
#R 
#Pregunta : 4

#Importamos el archivo

df_V <- read_excel("Vendedor.xlsx")

#Seleccionamos las columnas 

df_V <- df_V %>%
  select(IdVendedor, Nombre, Apellido)


#Exportamos los resultados

write_xlsx(df_V, "Vendedor_final.xlsx")

#############################################################
#R 
#Pregunta : 5

#Importamos el archivo

df_P <- read_excel("Productos.xlsx")

#Seleccionamos las columnas 

df_P <- df_P %>%
  select(IdProducto, Name, cat)


#Exportamos los resultados

write_xlsx(df_P, "Productos_final.xlsx")

#############################################################
#R 
#Pregunta: 6

#Asignamos un directorio de trabajo


#Importamos la información
df_Data_2017 <- read_excel("2017.xlsx")
df_Data_2018 <- read_excel("2018.xlsx")
df_Data_2019 <- read_excel("2019.xlsx")

##Generamos el merge horizontal con toda la infomación de cada hoja

df_Data <- bind_rows(df_Data_2017,df_Data_2018,df_Data_2019) #bind_rows es de dplyr

#Seleccionamos lo relevante

df_Data <- df_Data %>%
  select(OrdenId, Fecha, IdTerr, IdCliente, IdProducto, IdEmp, Cantidad, Valido, PrecioUntario, Costo)

df_Data <- df_Data %>% 
  rename(
    IdTerritorio = IdTerr,
    IdVendedor = IdEmp
  )

#Exportamos los resultados

write_xlsx(df_Data, "Data.xlsx")


