import logo from './logo.svg';
import './App.css';
import { BrowserRouter as Router, Route, Link } from 'react-router-dom';
import OtherPage from './OtherPage';
import Fib from './Fib';

function App() {
  return (
    <Router>
      <div className="App">
      <h2 className="App-header">
        <p>
          Fib app
        </p>
        <Link to="/">Home</Link>
        <Link to="/otherpage">Other Page</Link>
      </h2>
      <div>
        <Route exact path="/" component={Fib} />
        <Route path="/otherpage" component={OtherPage} /> 
      </div>
    </div>
    </Router>
  );
}

export default App;
