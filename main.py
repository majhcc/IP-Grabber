from multiprocessing.dummy import Process
import os
from fastapi import FastAPI, Request
from fastapi.responses import RedirectResponse  
import uvicorn 

from pyngrok import ngrok

app = FastAPI()

@app.get("/")
def root(request: Request): 
    print(
        "IP: " + request.client.host + "\n"
        "User Agent: " + request.headers.get("User-Agent") + "\n"
        )  # prints IP address of client.
    return RedirectResponse('https://www.google.com')

def run_server():
    uvicorn.run(app, port=5050, log_level="critical")

def ngroka():
    ngrok.set_auth_token('1rXP6ntn53SWlaxcGggUlFVeHA0_4Pj98qAkNebWC9iuNbyfz')
    url = ngrok.connect(5050)
    print(url)




if __name__ == "__main__":
    try:
        server_thread = Process(target=run_server)
        ngrok_thread = Process(target=ngroka)
        server_thread.start()
        ngrok_thread.start()
        while True:
            pass
    except KeyboardInterrupt:
        os.kill(os.getpid(), 9)
        # server_thread.terminate()
        # ngrok_thread.terminate()
    

