import React from 'react';
import { createRoot } from 'react-dom/client';

const htmlelement = document.getElementById('root');
const rootreact = createRoot(htmlelement);
const App = () => {
  return (
    <div>
      <Header />
      <Footer />
      <Body />
    </div>
  );
};

const Header = () => {
  return (
    <header>
      <div className="icon">Moviez</div>
      <div className="search-bar">
        <input type="text" placeholder="Search for movies..." />
      </div>
      <nav>
        <ul>
          <li><a href="#movies">Movies</a></li>
          <li className="location-select">
            <select>
              <option>Location</option>
              <option>Visakhapatnam</option>
              <option>Vijayawada</option>
              <option>Viziangaram</option>
              <option>Hyderabad</option>
              <option>bangalore</option>
              <option>Mysore</option>
              <option>Warngal</option>
              <option>Delhi</option>
              <option>Kolkata</option>
              <option>Chennai</option>
              <option>kerala</option>
              <option>bhuvaneswar</option>
              <option>mumbai</option>
            </select>
          </li>
          <li><a href="#signin">SignIn</a></li>
        </ul>
      </nav>
    </header>
  );
}

const Body = () => {
  return (
    <div>
      this is body
    </div>
  );
}

const Footer = () => {
  return (
    <div>
      this is footer
    </div>
  );
}

rootreact.render(<App />);
