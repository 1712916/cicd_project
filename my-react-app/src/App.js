import logo from './logo.svg';
import './App.css';
import LoginPage from './pages/login/login.page';
import { BrowserRouter as Router, Routes, Route, Link } from 'react-router-dom';
import HomePage from './pages/home/home.page';

const NotFound = () => (
  <div>
    <h1>404 - Not Found!</h1>
    <Link to="/">Go Home</Link>
  </div>
);

function App() {
  return (
    <div className="App">
      <Router>
        <Routes>
          <Route exact path='/' element={< HomePage />}></Route>
          <Route exact path='/login' element={< LoginPage />}></Route>
          <Route component={NotFound} />
        </Routes>
      </Router>
    </div>
  );
}

export default App;
