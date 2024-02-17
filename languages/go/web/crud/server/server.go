package server

import (
	"fmt"
	"log"
	"net/http"

	"github.com/SerhiiCho/crud/store"
	"github.com/SerhiiCho/crud/store/sqlstore"
	"github.com/gorilla/mux"
	"github.com/textwire/textwire"
)

var tpl *textwire.Template

const (
	port             = "8080"
	getCurrencyURL   = "https://api.privatbank.ua/p24api/pubinfo?json&exchange&coursid=5"
	mysqlCredentials = "root:@/crud"
)

func init() {
	var err error

	tpl, err = textwire.NewTemplate(&textwire.Config{
		TemplateDir: "../templates",
	})

	if err != nil {
		log.Fatalln(err)
	}
}

type server struct {
	router *mux.Router
	store  store.Store
}

// newServer configures router and returns pointer to a server struct
func newServer(store store.Store) *server {
	s := &server{
		router: mux.NewRouter(),
		store:  store,
	}

	s.configureRouter()

	return s
}

// ServeHTTP serves http
func (s server) ServeHTTP(w http.ResponseWriter, r *http.Request) {
	s.router.ServeHTTP(w, r)
}

func (s server) configureRouter() {
	s.router.HandleFunc("/", s.home()).Methods("GET")
	s.router.HandleFunc("/books", s.insertBook()).Methods("POST")
	s.router.HandleFunc("/books/{id}/edit", s.editBook()).Methods("GET")
	s.router.HandleFunc("/books/create", s.createBook()).Methods("GET")
	s.router.HandleFunc("/books/update", s.updateBook()).Methods("POST")
	s.router.HandleFunc("/books/delete", s.deleteBook()).Methods("POST")
}

// Start starts the server
func Start() error {
	db, dbErr := newDB()

	if dbErr != nil {
		return dbErr
	}

	defer db.Close()

	s := sqlstore.New(db)

	fmt.Printf("Serving on http://localhost:%s\n", port)
	return http.ListenAndServe(":"+port, newServer(s))
}
