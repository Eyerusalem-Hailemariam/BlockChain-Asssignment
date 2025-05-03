const express = require('express');
const app = express();
const cors = require('cors');
const port = 3000;

app.use(cors());
app.use(express.json());

const balances = {
    "0x1" : 100,
    "0x2" : 50,
    "0x3" : 75,
};

app.get('/balance/:address', (req, res) => {
    const address = req.params.address;
    const balance = balances[address];
    if (balance !== undefined) {
        res.json({ balance });
    } else {
        res.status(404).json({ error: 'Address not found' });
    }
});

app.post('/transfer', (req, res) => {
    const { from, to, amount } = req.body;

    if (!balances[from] || !balances[to]) {
        return res.status(400).json({ error: 'Invalid address' });
    }

    if (balances[from] < amount) {
        return res.status(400).json({ error: 'Insufficient balance' });
    }

    balances[from] -= amount;
    balances[to] += amount;

       res.json({ from, to, amount });
});