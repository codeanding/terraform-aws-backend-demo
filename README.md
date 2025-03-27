# 🚀 terraform-aws-backend-demo

Este proyecto demuestra cómo desplegar un backend básico en AWS ECS Fargate utilizando **Infraestructura como Código con Terraform**.  
Incluye base de datos RDS, balanceador ALB, ECR, VPC privada/pública y un backend de ejemplo construido con **NestJS + Prisma**.

> 💡 Ideal para entender y aplicar buenas prácticas de Terraform modularizado y despliegue automático en AWS.

---

## 📦 Estructura del proyecto

```
.
├── backend/              # Código del backend en NestJS
│   └── scripts/
│       └── build-and-push.sh
├── infra/                # Infraestructura en Terraform
│   ├── modules/          # Módulos reutilizables
│   ├── scripts/
│   │   ├── deploy.sh
│   │   └── destroy.sh
│   └── main.tf
└── diagrams/             # Diagrama generado automáticamente
```

---

## ✅ Requisitos

- AWS CLI configurado con un perfil válido (ej: `codeanding`)
- Terraform ≥ 1.5.x
- Docker
- Node.js (para ejecutar el backend si lo deseas localmente)
- Graphviz (`dot`) para generar el diagrama

---

## 🌐 Crear recursos base para el backend remoto de Terraform

```bash
aws s3api create-bucket \
 --bucket tcg-demo-terraform-state \
 --region us-west-2 \
 --create-bucket-configuration LocationConstraint=us-west-2 \
 --profile codeanding

aws dynamodb create-table \
 --table-name codeanding-tcg-demo-locks \
 --attribute-definitions AttributeName=LockID,AttributeType=S \
 --key-schema AttributeName=LockID,KeyType=HASH \
 --billing-mode PAY_PER_REQUEST \
 --region us-west-2 \
 --profile codeanding
```

---

## 🚀 Desplegar infraestructura

```bash
sh infra/scripts/deploy.sh
```

---

## 🐳 Build y Push de imagen Docker a ECR

```bash
sh backend/scripts/build-and-push.sh
```

---

## 🧪 Probar backend localmente (Swagger UI)

1. Instalar dependencias:

   ```bash
   cd backend
   npm install
   ```

2. Levantar el backend:

   ```bash
   npm run start:dev
   ```

3. Abrir: [http://localhost:3000/api](http://localhost:3000/api)

---

## 🧼 Destruir recursos

```bash
sh infra/scripts/destroy.sh
```

---

## 🖼️ Generar diagrama de arquitectura

```bash
sh generate_diagram.sh
```

Resultado: `./diagrams/diagram.png`

---

## ✍️ Autor

Desarrollado por [@codeanding](https://github.com/codeanding) para el evento **Awesome Women Summit 2025** 🎤💜

---

## 📝 Licencia

MIT — libre uso y aprendizaje ✨
