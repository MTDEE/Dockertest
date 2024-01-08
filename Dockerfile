FROM alpine:3.14

# ติดตั้ง Node.js และ npm
RUN apk --no-cache add nodejs npm

WORKDIR /app

# คัดลอก package.json และ package-lock.json ไปก่อนเพื่อให้ใช้ Docker cache ได้
COPY package*.json ./

# ติดตั้ง dependencies
RUN npm install

# คัดลอกส่วนที่เหลือของแอปพลิเคชัน
COPY . .

# สร้างแอปพลิเคชัน
CMD [ "node", "main.js" ]
