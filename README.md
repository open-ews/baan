# Baan (ບ້ານ)

[![Ruby](https://github.com/open-ews/baan/actions/workflows/build.yml/badge.svg)](https://github.com/open-ews/baan/actions/workflows/build.yml) [![codecov](https://codecov.io/github/open-ews/baan/graph/badge.svg?token=BnQJ13vZbX)](https://codecov.io/github/open-ews/baan)

**Baan** is a Ruby library that provides geodata for administrative regions in **Lao PDR**, including provinces and districts. The name *"Baan"* (ບ້ານ) means *"village"* in Lao, reflecting the project's aim to support geographic and community-based applications.

---

## 📦 Installation

Add this line to your Gemfile:

```ruby
gem "baan"
```

Then run:

```bash
bundle install
```

Or install it manually:

```bash
gem install baan
```

---

## 🗂️ Data Structure

The data is stored in YAML format under the `data/` directory:

```
/baan
  ├── lib/
  │   └── baan.rb
  └── data/
      ├── provinces.yml
```

Each record includes:

**Provinces**

* `code`: 3166-2:LA code
* `name_lo`: Lao name
* `name_en`: Romanized name
* `districts`: List of districts

**Districts**

* `code`: Administrative code
* `parent_division`: Parent province
* `name_lo`: Lao name
* `name_en`: Romanized name

---

## 🚀 Usage

```ruby
# Get all provinces
Baan::Province.all
=>
{"LA-VT" =>
  #<data Baan::Province
   code="LA-VT",
   name_en="Vientiane Prefecture",
   name_lo="ວຽງຈັນ",
   subdivisions=
    [#<data Baan::District code="0101", name_en="Chanthabuly", name_lo="ຈັນທະບູລີ", subdivisions=[], parent_division=#<data Baan::Province:...>>,],
   parent_division=nil>,
# ...other provinces
}

# Get a province by its code
Baan::Province["LA-VT"]
=>
#<data Baan::Province
 code="LA-VT",
 name_en="Vientiane Prefecture",
 name_lo="ວຽງຈັນ",
 subdivisions=
  [#<data Baan::District code="0101", name_en="Chanthabuly", name_lo="ຈັນທະບູລີ", subdivisions=[], parent_division=#<data Baan::Province:...>>,],
 parent_division=nil>

# Get all districts
Baan::District.all
=>
{"0101" =>
  #<data Baan::District
   code="0101",
   name_en="Chanthabuly",
   name_lo="ຈັນທະບູລີ",
   subdivisions=[],
   parent_division=#<data Baan::Province:...>>,
# ...other districts
}

# Get a district by its code
Baan::District["0101"]
=>
#<data Baan::District
 code="0101",
 name_en="Chanthabuly",
 name_lo="ຈັນທະບູລີ",
 subdivisions=[],
 parent_division=#<data Baan::Province:...>>
```

---

## 📚 Use Cases

* Mapping and visualization of Lao administrative areas
* Disaster response and early warning systems
* Localized apps and services for Laos
* Statistical and demographic analysis

---

## 📄 License

This library is available as open source under the **MIT License**.

---

## 🤝 Contributing

We welcome contributions, especially:

* Updated or corrected geodata
* Additional administrative levels (e.g. villages)
* Support for other output formats (e.g. JSON, CSV)

To contribute:

1. Fork the repository
2. Make your changes
3. Submit a pull request
