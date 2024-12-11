# Usa la imagen oficial de Go como base
FROM golang:1.23.4

# Establece el directorio de trabajo dentro del contenedor
WORKDIR /app

# Copia el go.mod y go.sum al contenedor
COPY go.mod go.sum ./

# Descarga las dependencias
RUN go mod tidy

# Copia el código fuente de la aplicación al contenedor
COPY . .

# Expone el puerto que usará la aplicación (8080 en este caso)
EXPOSE 8080

#Compila la aplicacion
RUN go build -o main .

# Comando para ejecutar la aplicación cuando el contenedor se inicie
CMD ["./api_server"]
