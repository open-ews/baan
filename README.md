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

The data is stored in YAML format under the `lib/data/` directory:

Each record includes:

**Provinces**

* `code`: [ISO 3166-2:LA code](https://en.wikipedia.org/wiki/ISO_3166-2:LA)
* `name_lo`: Lao name
* `name_en`: Romanized name
* `latitude`: Latitude
* `longitude`: Longitude
* `districts`: List of districts
* `villages`: List of villages

**Districts**

* `code`: Administrative code
* `province`: Province
* `name_lo`: Lao name
* `name_en`: Romanized name
* `latitude`: Latitude
* `longitude`: Longitude
* `villages`: List of villages

**Villages**

* `code`: Administrative code
* `province`: Province
* `district`: District
* `name_lo`: Lao name
* `name_en`: Romanized name
* `latitude`: Latitude
* `longitude`: Longitude

---

## 🚀 Usage

### Provinces

Get all provinces:

```ruby
Baan::Province.all
```

Get a province by its [ISO 3166-2:LA code](https://en.wikipedia.org/wiki/ISO_3166-2:LA):

```ruby
province = Baan::Province["LA-VT"]

puts province.name_en
# Vientiane Prefecture

puts province.name_lo
# ວຽງຈັນ

puts province.code
# LA-VT
```

Get the districts belonging to a province:

```ruby
province = Baan::Province["LA-VT"]

province.districts.each do |district|
  puts "#{district.code}: #{district.name_en}"
end
```

### Districts

Get all districts:

```ruby
Baan::District.all
```

Get a district by its code:

```ruby
district = Baan::District["0101"]

puts district.name_en
# Chanthabuly

puts district.name_lo
# ຈັນທະບູລີ

puts district.code
# 0101
```

Get the province containing a district:

```ruby
district = Baan::District["0101"]

puts district.province.code
# LA-VT

puts district.province.name_en
# Vientiane Prefecture
```

### Villages

Baan includes village-level data for some districts. Villages are subdivisions of districts and include their geographic coordinates.

For example, Attapeu province has the code `LA-AT`.

Get the Attapeu province:

```ruby
province = Baan::Province["LA-AT"]

puts province.code
# LA-AT

puts province.name_en
# Attapeu
```

Get a district in Attapeu:

```ruby
district = Baan::District["1705"]

puts district.code
# 1705

puts district.name_en
# Phouvong
```

Get the villages belonging to the district:

```ruby
district.villages.each do |village|
  puts "#{village.code}: #{village.name_en}"
end
```

Get all villages:

```ruby
Baan::Village.all
```

Get a village by its code:

```ruby
village = Baan::Village["17050001"]

puts village.code
# 17050001

puts village.name_en
# Veingxay

puts village.name_lo
# ວຽງໄຊ

puts village.latitude
# 14.450055

puts village.longitude
# 106.690862
```

A village's parent division is its district:

```ruby
village = Baan::Village["17050001"]
district = village.district

puts district.code
# 1705

puts district.name_en
# Phouvong
```

The district's parent division is its province:

```ruby
village = Baan::Village["17050001"]
province = village.province

puts province.code
# LA-AT

puts province.name_en
# Attapeu
```

You can therefore traverse the complete administrative hierarchy from a village:

```ruby
village = Baan::Village["17050001"]

puts "#{village.province.name_en} > #{village.district.name_en} > #{village.name_en}"
# Attapeu > Phouvong > Veingxay
```

Village records have the following attributes:

| Attribute   | Description                         |
| ----------- | ----------------------------------- |
| `code`      | Unique village code                 |
| `name_en`   | English village name                |
| `name_lo`   | Lao village name                    |
| `latitude`  | Village latitude                    |
| `longitude` | Village longitude                   |
| `district`  | The district containing the village |
| `province`  | The province containing the village |


Village codes are prefixed with their district code. For example, village `17050001` belongs to district `1705`.

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
