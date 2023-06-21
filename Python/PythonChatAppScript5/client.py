# import modules
import socket
import threading
import tkinter as tk
from tkinter import scrolledtext
from tkinter import messagebox

HOST = '127.0.0.1'
PORT = 1234

GREY = '#808080'
GREY = '#808080'
ROYAL_BLUE = '#4169e1'
BLACK = "black"
FONT = ("Arial", 17)
BUTTON_FONT = ("Arial", 15)
SMALL_FONT = ("Arial", 13)

# Creating a socket object
# AF_INET: IPv4 addresses
# SOCK_STREAM: TCP packets for communication
client = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

def add_message(message):
    message_box.config(state=tk.NORMAL)
    message_box.insert(tk.END, message + '\n')
    message_box.config(state=tk.DISABLED)

def connect():

    # try except block
    try:

        # Connect to the server
        client.connect((HOST, PORT))
        print("Connected to server")
        add_message("[CHATSERVER] Connected to the server")
    except:
        messagebox.showerror("Unable to connect to server", f"Unable to connect to server {HOST} {PORT}")

    username = username_textbox.get()
    if username != '':
        client.sendall(username.encode())
    else:
        messagebox.showerror("Invalid Username", "Enter Username")

    threading.Thread(target=listen_for_messages_from_server, args=(client, )).start()

    username_textbox.config(state=tk.DISABLED)
    username_button.config(state=tk.DISABLED)

def send_message():
    message = message_textbox.get()
    if message != '':
        client.sendall(message.encode())
        message_textbox.delete(0, len(message))
    else:
        messagebox.showerror("Empty Message", "Please Enter Message")

root = tk.Tk()
root.geometry("600x600")
root.title("ChatRoom")
root.resizable(False, False)

root.grid_rowconfigure(0, weight=1)
root.grid_rowconfigure(1, weight=4)
root.grid_rowconfigure(2, weight=1)

top_frame = tk.Frame(root, width=600, height=100, bg=GREY)
top_frame.grid(row=0, column=0, sticky=tk.NSEW)

middle_frame = tk.Frame(root, width=600, height=400, bg=GREY)
middle_frame.grid(row=1, column=0, sticky=tk.NSEW)

bottom_frame = tk.Frame(root, width=600, height=100, bg=GREY)
bottom_frame.grid(row=2, column=0, sticky=tk.NSEW)

username_label = tk.Label(top_frame, text="Enter Nickname:", font=FONT, bg=GREY, fg=BLACK)
username_label.pack(side=tk.LEFT, padx=10)

username_textbox = tk.Entry(top_frame, font=FONT, bg=GREY, fg=BLACK, width=23)
username_textbox.pack(side=tk.LEFT)

username_button = tk.Button(top_frame, text="Join", font=BUTTON_FONT, bg=ROYAL_BLUE, fg=BLACK, command=connect)
username_button.pack(side=tk.LEFT, padx=15)

message_textbox = tk.Entry(bottom_frame, font=FONT, bg=GREY, fg=BLACK, width=38)
message_textbox.pack(side=tk.LEFT, padx=10)

message_button = tk.Button(bottom_frame, text="Send", font=BUTTON_FONT, bg=ROYAL_BLUE, fg=BLACK, command=send_message)
message_button.pack(side=tk.LEFT, padx=10)

message_box = scrolledtext.ScrolledText(middle_frame, font=SMALL_FONT, bg=GREY, fg=BLACK, width=67, height=26.5)
message_box.config(state=tk.DISABLED)
message_box.pack(side=tk.TOP)


def listen_for_messages_from_server(client):

    while 1:

        message = client.recv(2048).decode('utf-8')
        if message != '':
            username = message.split("~")[0]
            content = message.split('~')[1]

            add_message(f"[{username}] {content}")
            
        else:
            messagebox.showerror("Error", "Message recevied from client is empty")

# main function
def main():

    root.mainloop()
    
if __name__ == '__main__':
    main()