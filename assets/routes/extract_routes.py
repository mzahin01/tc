import requests
import json

def check_if_stops_in_route(train_model):
    full_url = 'https://railspaapi.shohoz.com/v1.0/web/train-routes'

    headers = {
        'User-Agent': 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36',
        'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8',
        'Accept-Language': 'en-US,en;q=0.9',
        'Content-Type': 'application/json',
    }

    body = {
        'model': train_model,
        'departure_date_time': '2024-12-25',
    }

    try:
        response = requests.post(full_url, headers=headers, json=body)

        if response.status_code == 200:
            route_details_response = response.json()
            return route_details_response
        else:
            print(f'Error: {response.status_code}')
            return None

    except Exception as e:
        print(f'An error occurred: {e}')
        return None

# List of train model codes and names
train_models = [
    ("701", "Subarna Express"),
    ("702", "Subarna Express"),
    ("703", "Mohanagar Morning Express"),
    ("704", "Mohanagar Night Express"),
    ("705", "Ekota Express"),
    ("706", "Ekota Express"),
    ("707", "Tista Express"),
    ("708", "Tista Express"),
    ("709", "Parabat Express"),
    ("710", "Parabat Express"),
    ("711", "Upakul Express"),
    ("712", "Upakul Express"),
    ("713", "Karatoya Express"),
    ("714", "Karatoya Express"),
    ("715", "Kapotaksha Express"),
    ("716", "Kapotaksha Express"),
    ("717", "Jayantika Express"),
    ("718", "Jayantika Express"),
    ("719", "Paharika Express"),
    ("720", "Paharika Express"),
    ("721", "Mohanagar Express"),
    ("722", "Mohanagar Express"),
    ("723", "Udayan Express"),
    ("724", "Udayan Express"),
    ("725", "Sundarban Express"),
    ("726", "Sundarban Express"),
    ("727", "Rupsha Express"),
    ("728", "Rupsha Express"),
    ("729", "Meghna Express"),
    ("730", "Meghna Express"),
    ("731", "Barendra Express"),
    ("732", "Barendra Express"),
    ("733", "Titumir Express"),
    ("734", "Titumir Express"),
    ("735", "Agnibina Express"),
    ("736", "Agnibina Express"),
    ("737", "Egarosindhur Morning"),
    ("738", "Egarosindhur Morning"),
    ("739", "Upaban Express"),
    ("740", "Upaban Express"),
    ("741", "Turna Express"),
    ("742", "Turna Express"),
    ("743", "Brahmaputra Express"),
    ("744", "Brahmaputra Express"),
    ("745", "Jamuna Express"),
    ("746", "Jamuna Express"),
    ("747", "Simanta Express"),
    ("748", "Simanta Express"),
    ("749", "Egarosindhur Night Express"),
    ("750", "Egarosindhur Night Express"),
    ("751", "Lalmoni Express"),
    ("752", "Lalmoni Express"),
    ("753", "Silkcity Express"),
    ("754", "Silkcity Express"),
    ("755", "Madhumati Express"),
    ("756", "Madhumati Express"),
    ("757", "Drutojan Express"),
    ("758", "Drutojan Express"),
    ("759", "Padma Express"),
    ("760", "Padma Express"),
    ("761", "Sagardari Express"),
    ("762", "Sagardari Express"),
    ("763", "Chitra Express"),
    ("764", "Chitra Express"),
    ("765", "Nilsagar Express"),
    ("766", "Nilsagar Express"),
    ("767", "Dolonchapa Express"),
    ("768", "Dolonchapa Express"),
    ("769", "Dhumketu Express"),
    ("770", "Dhumketu Express"),
    ("771", "Rangpur Express"),
    ("772", "Rangpur Express"),
    ("773", "Kalni Express"),
    ("774", "Kalni Express"),
    ("775", "Sirajganj Express"),
    ("776", "Sirajganj Express"),
    ("777", "Haor Express"),
    ("778", "Haor Express"),
    ("779", "Dhalarchar Express"),
    ("780", "Dhalarchar Express"),
    ("781", "Kishoreganj Express"),
    ("782", "Kishoreganj Express"),
    ("783", "Tungipara Express"),
    ("784", "Tungipara Express"),
    ("785", "Bijoy Express"),
    ("786", "Bijoy Express"),
    ("787", "Shonar Bangla Express"),
    ("788", "Shonar Bangla Express"),
    ("789", "Mohanganj Express"),
    ("790", "Mohanganj Express"),
    ("791", "Banalata Express"),
    ("792", "Banalata Express"),
    ("793", "Panchagarh Express"),
    ("794", "Panchagarh Express"),
    ("795", "Benapole Express"),
    ("796", "Benapole Express"),
    ("797", "Kurigram Express"),
    ("798", "Kurigram Express"),
    ("799", "Jamalpur Express"),
    ("800", "Jamalpur Express"),
    ("801", "Chattala Express"),
    ("802", "Chattala Express"),
    ("803", "Banglabandha Express"),
    ("804", "Banglabandha Express"),
    ("805", "Chilahati Express"),
    ("806", "Chilahati Express"),
    ("807", "Pabna Express"),
    ("808", "Pabna Express"),
    ("809", "Burimari Express"),
    ("810", "Burimari Express"),
    ("811", "Express"),
    ("812", "Express"),
    ("813", "Cox’s Bazar Express"),
    ("814", "Cox’s Bazar Express"),
    ("815", "Parjatak Express"),
    ("816", "Parjatak Express"),
    ("817", "Surbarnachar Express"),
    ("818", "Surbarnachar Express"),
    ("819", "Tanguar Express"),
    ("820", "Tanguar Express"),
]

# Call the API for each train model and store responses
for code, name in train_models:
    result = check_if_stops_in_route(code)
    if result:
        filename = f"response_{code}.json"
        with open(filename, 'w') as file:
            json.dump(result, file, indent=4)
        print(f"Response for {name} saved to {filename}")
    else:
        print(f"Failed to retrieve data for {name}")
