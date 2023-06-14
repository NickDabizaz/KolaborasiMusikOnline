const express = require('express');
const app = express();
const userRoutes = require('./routes/userRoutes');
const musisiRoutes = require('./routes/musisiRoutes');
const produserRoutes = require('./routes/produserRoutes');

app.use(express.json());
app.use(express.urlencoded({ extended: true }))

app.use('/api/v1/musisi', musisiRoutes);
app.use('/api/v1/produser', produserRoutes);
app.use('/api/v1/users', userRoutes);

app.listen(3000, () => {
  console.log('Server is running on port 3000');
});
