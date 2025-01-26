require("dotenv").config();
const express = require("express");
const mongoose = require("mongoose");
const cors = require('cors');

const app = express();

// Middleware
app.use(express.json());
app.use(cors());

// MongoDB Connection
mongoose.connect(process.env.MONGO_URI);

// Routes
app.use("/api/auth", require("./routes/auth"));

const PORT = process.env.PORT || 2000;
app.listen(PORT, () => console.log(`Server running on port ${PORT}`));
