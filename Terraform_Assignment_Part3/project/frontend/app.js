const express = require('express');

const app = express();
const PORT = 3000;

app.use(express.urlencoded({ extended: true }));
app.use(express.static('public'));

app.post('/submit', async (req, res) => {
    try {
        const response = await fetch(process.env.BACKEND_URL + '/submit', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded'
            },
            body: new URLSearchParams({
                name: req.body.name,
                password: req.body.password
            })
        });

        const data = await response.text();
        res.status(response.status).send(data);
    } catch (error) {
        res.status(500).send('Unable to connect to Flask backend');
    }
});

app.listen(PORT, () => {
    console.log(`Frontend running on http://localhost:${PORT}`);
});