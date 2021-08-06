import socket
import wave

import sys


def main():
    wave_file = sys.argv[1]
    host = "localhost"
    port = 5050
    s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    s.connect((host, port))

    with wave.open(wave_file, "rb") as f:
        while True:
            data = f.readframes(1024)
            if data == b"":
                s.shutdown(socket.SHUT_WR)
                break
            s.sendall(data)

    while True:
        res = s.recv(1024)
        if res == b"":
            break
        print(res.decode("utf-8"))
    s.close()


if __name__ == "__main__":
    main()
