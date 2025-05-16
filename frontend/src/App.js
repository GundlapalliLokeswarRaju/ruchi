import React, { useState } from 'react';
import axios from 'axios';

function App() {
  const [a, setA] = useState('');
  const [b, setB] = useState('');
  const [result, setResult] = useState(null);

  const handleAdd = async () => {
    try {
      const response = await axios.post('http://54.166.113.192:8000/api/add/', {
        a: parseInt(a),
        b: parseInt(b),
      });
      setResult(response.data.result);
    } catch (error) {
      console.error('Error:', error);
    }
  };

  return (
    <div style={{ padding: '20px' }}>
      <h2>Simple Calculator</h2>
      <input type="number" value={a} onChange={(e) => setA(e.target.value)} placeholder="Enter first number" />
      <input type="number" value={b} onChange={(e) => setB(e.target.value)} placeholder="Enter second number" />
      <button onClick={handleAdd}>Add</button>
      {result !== null && <h3>Result: {result}</h3>}
    </div>
  );
}

export default App;
