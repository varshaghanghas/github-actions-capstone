const express = require('express');
const app = express();
const PORT = process.env.PORT || 3000;

app.get('/health', (req, res) => {
    res.status(200).json({ 
        status: 'UP', 
        timestamp: new Date().toISOString() 
    });
});

app.listen(PORT, () => {
    console.log(`Application actively listening on port ${PORT}`);
});
