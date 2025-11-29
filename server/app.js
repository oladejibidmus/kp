// Entry point for the server application
const express = require('express');
const app = express();

// Middleware & Routes
app.use(express.json());

app.listen(3000, () => {
    console.log('Server is running on port 3000');
});
