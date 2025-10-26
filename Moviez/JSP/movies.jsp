<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Movies</title>
<style>
.search {
    text-align: center;
}
.search input {
    width: 25%;
    padding: 9px;
    font-size: 19px;
    border: 2px solid;
    border-radius: 19px;
    border-color: black;
}
.movies-section {
    padding: 40px 20px;
    text-align: center;
}
.movies-section h2 {
    margin-bottom: 30px;
}
.movie-div {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
    gap: 19px;
    max-width: 1250px;
    margin: 0 auto;
}
.movie-link {
    background-color: white;
    border-radius: 9px;
    overflow: hidden;
    transition: transform 0.3s;
    /* Fixed constraints */
    width: 100%;
    height: auto;
}
.movie-link:hover {
    transform: scale(1.03);
}
.movie-link img {
    width: 100%;
    height: 350px;
    object-fit: cover;
}
.movie-link h3 {
    margin: 0;
    font-size: 15px;
}
.rating {
    color: orangered;
}
.genre {
    color: dimgrey;
}
.hidden {
    display: none;
}
</style>
</head>
<body>
<div class="search">
    <input type="search" id="searchInput" placeholder="Search for Movies....." onkeyup="filterMovies()">
</div>

<section class="movies-section" id="movies">
    <h2>Featured Movies</h2>
    <div class="movie-div" id="movieContainer">
        <!-- Movie 1 - Crayon Shin-chan -->
        <div class="movie-link" data-name="crayon shin-chan">
            <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR4YX41aXPvObz3NY7Zf44qK6LlQGA0gsnmqA&s" alt="Shin-chan Movie Poster">
            <p>Crayon Shin-chan the Movie: Super Hot! The Spicy Kasukabe Dancers</p>
            <p class="rating">8.8/10 (89k+ votes)</p>
            <p>Telugu,Tamil,Hindi,Japanese</p>
            <p>2h 35min<span style="font-size: 1.5em;">&middot;</span>Comedy/Action/Adventure<span style="font-size: 1.5em;">&middot;</span>U</p>
            <h3>Synopsis</h3>
            <p>After the Kasukabe Defence Force wins a trip to India, Shinnosuke and Bo-chan enter a suspicious general store and find a backpack that holds a terrifying secret.</p>
            <h3>Cast</h3>
            <p>Kento Kaku,Toshiyuki Morikawa,Satomi Kōrogi</p>  
            <a href="theatres"><button>Book Now</button></a>
        </div>
        
        <!-- Movie 2 - Demon Slayer -->
        <div class="movie-link" data-name="demon slayer">
            <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQq8eiRxKhNlimzGKM6RkJ-WF0CsIZ5x5MxVw&s" alt="DemonSlayer Movie Poster">
            <p>Demon Slayer: Kimetsu no Yaiba Infinity Castle</p>
            <p class="rating">9.5/10 (300k+ votes)</p>
            <p>Telugu,Tamil,Hindi,Japanese</p>
            <p>2h 53min<span style="font-size: 1.5em;">&middot;</span>Action,Adventure<span style="font-size: 1.5em;">&middot;</span>U</p>
            <h3>Synopsis</h3>
            <p>Tanjiro Kamado and other members of the Demon Slayer Corps find themselves in an epic battle at Infinity Castle.</p>
            <h3>Cast</h3>
            <p>Kana Hanazawa,Saori Hayami,Natsuki Hanae,Mamoru Miyano,Akira Ishida</p>  
            <h3>Reviews</h3>
            <p>After such a long wait, Demon Slayer: Infinity Castle finally arrived — and I can honestly say it was worth every second.</p>
            <a href="theatres"><button>Book Now</button></a>
        </div>
        
        <!-- Movie 3 - Chainsaw Man -->
        <div class="movie-link" data-name="chainsaw man">
            <img src="https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcSlacjk-N2t0Ool13mp3eZJAHGCfN-ce_J6qt6BsL08mYbzeJetpHS2kTjRzy8kZMVHdP_OnA" alt="Chainsaw Man Movie Poster">
            <p>Chainsaw Man - The Movie: Reze Arc</p>
            <p class="rating">8.7/10 (150k+ votes)</p>
            <p class="genre">Hindi,Japanese</p>
            <p>2h 15min<span style="font-size: 1.5em;">&middot;</span>Action,Comedy<span style="font-size: 1.5em;">&middot;</span>UA</p>
            <h3>Synopsis</h3>
            <p>N/A</p>
            <h3>Cast</h3>
            <p>Kikunosuke Toya,Tomori Kusunoki</p>  
            <a href="theatres"><button>Book Now</button></a>
        </div>
        
        <!-- Movie 4 - Your Name -->
        <div class="movie-link" data-name="your name">
            <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSc1wRH-F9T9hqurHuDoBw-9QtbPISgILytGw&s" alt="Your Name Movie Poster">
            <p>Your Name</p>
            <p class="rating">9.7/10 (450k+ votes)</p>
            <p>English,Hindi,Japanese</p>
            <p>2h 27min<span style="font-size: 1.5em;">&middot;</span>Romance,Fantasy,Supernatural,Drama<span style="font-size: 1.5em;">&middot;</span>UA</p>
            <h3>Synopsis</h3>
            <p>Two teenagers share a profound, magical connection upon discovering they are swapping bodies. Things manage to become even more complicated when the boy and girl decide to meet in person.</p>
            <h3>Cast</h3>
            <p>Ryuunosuke Kamiki,Masami Nagasawa,Mone KamishiraishiEtsuko Ichihara</p>  
            <a href="theatres"><button>Book Now</button></a>
        </div>
    </div>
</section>

<script>
function filterMovies() {
    const searchTerm = document.getElementById('searchInput').value.toLowerCase();
    const movies = document.querySelectorAll('.movie-link');
    
    movies.forEach(movie => {
        const movieName = movie.getAttribute('data-name').toLowerCase();
        
        // Check if movie name starts with the search term
        if (movieName.startsWith(searchTerm)) {
            movie.style.display = 'block';
        } else {
            movie.style.display = 'none';
        }
    });
}
</script>
</body>
</html>
