import React from 'react';
import { createRoot } from 'react-dom/client';

const htmlelement = document.getElementById('root');
const rootreact = createRoot(htmlelement);

// header using components,object-array,props,map
const header = {
  icon: "Moviez",
  nav: [
    { title: "Movies", href: "?movies" },
    {
      type: "location",
      options: [
        "Location",
        "Visakhapatnam",
        "Vijayawada",
        "Viziangaram",
        "Hyderabad",
        "Bangalore",
        "Mysore",
        "Warngal",
        "Delhi",
        "Kolkata",
        "Chennai",
        "Kerala",
        "Bhuvaneswar",
        "Mumbai"
      ]
    },
    { title: "SignIn", href: "#signin" }
  ]
};

const Header = ({ icon, nav }) => {
  return (
    <header>
      <div className="icon">{icon}</div>
      <div className="search-bar">
        <input type="text" placeholder="Search for movies..." />
      </div>
      <nav>
        <ul>
          {nav.map((item, index) => (
            <li key={index} className={item.type === "location" ? "location-select" : ""}>
              {item.type === "location" ? (
                <select>
                  {item.options.map((option, optionIndex) => (
                    <option key={optionIndex}>{option}</option>
                  ))}
                </select>
              ) : (
                <a href={item.href}>{item.title}</a>
              )}
            </li>
          ))}
        </ul>
      </nav>
    </header>
  );
}

// body using  components,props,object-array,map method
const body = {
  section: "Featured Movies",
  movies: [
    {
      id: 1,
      image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR4YX41aXPvObz3NY7Zf44qK6LlQGA0gsnmqA&s",
      alt: "Shin-chan Movie Poster",
      title: "Crayon Shin-chan the Movie: Super Hot! The Spicy Kasukabe Dancers",
      rating: "8.8/10 250+Likes",
      genre: "Comedy/Action/Adventure"
    },
    {
      id: 2,
      image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQq8eiRxKhNlimzGKM6RkJ-WF0CsIZ5x5MxVw&s",
      alt: "DemonSlayer Movie Poster",
      title: "Demon Slayer: Kimetsu no Yaiba Infinity Castle",
      rating: "9.8/10 10k+Likes",
      genre: "Adventure/Action"
    },
    {
      id: 3,
      image: "https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcSlacjk-N2t0Ool13mp3eZJAHGCfN-ce_J6qt6BsL08mYbzeJetpHS2kTjRzy8kZMVHdP_OnA",
      alt: "Chainsaw Man Movie Poster",
      title: "Chainsaw Man - The Movie: Reze Arc",
      rating: "9.0/10 450+Likes",
      genre: "Comedy/Action/Thriller"
    },
    {
      id: 4,
      image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSc1wRH-F9T9hqurHuDoBw-9QtbPISgILytGw&s",
      alt: "Your Name Movie Poster",
      title: "Your Name",
      rating: "9.5/10 950+Likes",
      genre: "Drama/Sci-Fi/Romantic"
    }
  ]
};

const Body = ({ section, movies }) => {
  return (
    <section className="movies-section" id="movies">
      <h2>{section}</h2>
      <div className="movie-div">
        {movies.map(movie => (
          <div key={movie.id} className="movie-link">
            <img src={movie.image} alt={movie.alt} />
            <h3>{movie.title}</h3>
            <h3 className="rating">{movie.rating}</h3>
            <h3 className="genre">{movie.genre}</h3>
          </div>
        ))}
      </div>
    </section>
  );
}

// footer using component,props,map,object

const footer = {
  icon: "Moviez",
  copyright: "© 2025 Moviez. All rights reserved.",
  links: [
    { href: "?support", text: "support" }
  ]
};

const Footer = ({ icon, copyright, links }) => {
  return (
    <footer>
      <div className="footer-div">
        <div id="footer-icon">{icon}</div>
        <p>{copyright}</p>
        <ol id="ol">
          {links.map((link, index) => (
            <a key={index} href={link.href}>{link.text}</a>
          ))}
        </ol>
      </div>
    </footer>
  );
}

const App = () => {
  return (
    <div>
      <Header
        icon={header.icon}
        placeholder={header.placeholder}
        nav={header.nav}
      />
      <Body
        section={body.section}
        movies={body.movies}
      />
      <Footer
        icon={footer.icon}
        copyright={footer.copyright}
        links={footer.links}
      />
    </div>
  );
};

rootreact.render(<App />);
