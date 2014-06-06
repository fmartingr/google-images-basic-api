google-images-basic-api
=======================

**EXPERIMENT: Not an actual project**

Google Images Basic API


```
~
❯ curl http://localhost:5000/hello/
{
    "error": null,
    "items": [
        "http://www.example.com/image........"
    ]
}

~
❯ curl http://localhost:5000/hello/\?limit\=4
{
    "error": null,
    "items": [
        "http://www.example.com/image........",
        "http://www.example.com/image........",
        "http://www.example.com/image........",
        "http://www.example.com/image........"
    ]
}

...
```

## USAGE

```
/<search query>/
or
/<search query>/?limit=<results number>

```
