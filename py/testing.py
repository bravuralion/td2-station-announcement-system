import tkinter as tk
import requests
from tkinter import ttk

def create_gui():
    root = tk.Tk()
    root.title("TD2 Station Announcement Tool")
    root.geometry("570x257")
    root.resizable(False, False)

    # Group Boxes
    settings_group = tk.LabelFrame(root, text="Settings", width=177, height=121)
    settings_group.place(x=381, y=10)
    train_passing_group = tk.LabelFrame(root, text="Train Passing at", width=177, height=79)
    train_passing_group.place(x=381, y=166)

    # Labels
    tk.Label(root, text="Track").place(x=9, y=103)
    tk.Label(root, text="Train").place(x=9, y=57)
    tk.Label(root, text="Station").place(x=9, y=10)
    tk.Label(root, text="Language").place(x=192, y=10)

    # Dropdowns
    stationDropdown = ttk.Combobox(root)
    stationDropdown.place(x=12, y=29, width=162)
    
    trackDropdown = ttk.Combobox(root)
    trackDropdown.place(x=12, y=122, width=162)
    
    ttk.Combobox(root).place(x=12, y=76, width=162)
    ttk.Combobox(root).place(x=12, y=29, width=162)

    # Checkboxes
    tk.Checkbutton(settings_group, text="Auto Update").place(x=6, y=0)
    tk.Checkbutton(settings_group, text="Announce Delays").place(x=6, y=22)
    tk.Checkbutton(settings_group, text="Play Audio").place(x=6, y=42)
    tk.Button(settings_group, text="Station Gong").place(x=6, y=62, width=110, height=23)

    # Language Selection
    language_listbox = tk.Listbox(root)
    language_listbox.insert(1, "English")
    language_listbox.insert(2, "Polish")
    language_listbox.insert(3, "German")
    language_listbox.place(x=192, y=29, width=147, height=49)

    # Buttons
    
    tk.Button(root, text="Generate Announcement").place(x=192, y=122, width=147, height=23)
    tk.Button(root, text="Update Trains").place(x=192, y=93, width=147, height=23)

    # Train Passing Buttons
    tk.Button(train_passing_group, text="1").place(x=6, y=0, width=28, height=23)
    tk.Button(train_passing_group, text="2").place(x=40, y=0, width=28, height=23)
    tk.Button(train_passing_group, text="3").place(x=74, y=0, width=28, height=23)
    tk.Button(train_passing_group, text="4").place(x=108, y=0, width=28, height=23)
    tk.Button(train_passing_group, text="5").place(x=142, y=0, width=28, height=23)
    tk.Button(train_passing_group, text="6").place(x=6, y=30, width=28, height=23)
    tk.Button(train_passing_group, text="7").place(x=40, y=30, width=28, height=23)
    tk.Button(train_passing_group, text="8").place(x=74, y=30, width=28, height=23)
    tk.Button(train_passing_group, text="9").place(x=108, y=30, width=28, height=23)
    tk.Button(train_passing_group, text="10").place(x=142, y=30, width=28, height=23)

    # Textbox
    log_console = tk.Text(root, wrap='word', height=5, width=40)
    log_console.place(x=12, y=166, width=363, height=79)
    
    for i in range(1, 601):
        trackDropdown['values'] = (*trackDropdown['values'], str(i)) #Inserting Tracks up to 600
        
    # Stationen von der API abrufen und in das Dropdown einfügen
    response = requests.get("https://stacjownik.spythere.pl/api/getSceneries")
    if response.status_code == 200:  # Überprüfen, ob die Anfrage erfolgreich war
        stationNames = [scenery['name'] for scenery in response.json()]  
        stationNames.sort()  # Stationsnamen sortieren
        stationDropdown['values'] = stationNames     

    root.mainloop()

if __name__ == "__main__":
    create_gui()
