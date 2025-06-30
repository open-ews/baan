# Baan (ບ້ານ)

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
      └── districts.yml
```

Each record includes:

**Provinces**

* `code`: Administrative code
* `name`: Lao name
* `name_en`: Romanized name

**Districts**

* `code`: Administrative code
* `province_code`: Parent province code
* `name`: Lao name
* `name_en`: Romanized name

---

## 🚀 Usage

```ruby
require "baan"

Baan.provinces
# => [{ "code" => "01", "name" => "ວຽງຈັນ", "name_en" => "Vientiane" }, ...]

Baan.districts_by_province("01")
# => [{ "code" => "0101", "province_code" => "01", "name" => "ໄຊເສດຖາ", "name_en" => "Saysettha" }, ...]
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
