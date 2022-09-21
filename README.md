# [Project Title]

## Getting Started

This project's working branch is `main`, and it has the following directory structure:

```
[REPOSITORY-Name]
	├── LICENSE.md
	├── Pipfile
	├── Pipfile.lock
	├── README.md
	├── data
	│   ├── raw
	│   └── processed
	├── docs
	│   └── support documentation and project descriptions
	└── src
	    └── all executbale script files
```

## Running the App

1. Clone the project
	```bash
	git clone [https://github.com/YOUR-USERNAME/YOUR-REPOSITORY]
	```
2. Install dependencies from pipfile. More [pipenv install info here](https://pipenv.pypa.io/en/latest/)
	```bash
	# install pipenv if you don't have it
	pip install --user pipenv
	```

	```bash
	# now we can install required dependencies
	pipenv install
	```
4. run `main.py`
	```bash
	python main.py
	```

This will use the data located in `data/raw` and run through the full data pipeline.

## Development

The goal of this project is to [short goal description].

The work is completed in stages:

1. [stage 1]
2. [stage 2]

### 	Part 1: Title

The scope is to...

### 	Part 2: Title

Here we will....

## Authors

#### Adam Broniewski

* [GitHub](https://github.com/abroniewski)
* [LinkedIn](https://www.linkedin.com/in/abroniewski/)
* [Website](https://adambron.com)

## License

This project is open source software [licensed as MIT][license].

## Acknowledgments


[license]: https://github.com/abroniewski/LICENSE.md
