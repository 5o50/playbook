# Nomad

https://developer.hashicorp.com/nomad/install


```
sudo nomad agent -dev \
  -bind 0.0.0.0 \
  -network-interface='{{ GetDefaultInterfaces | attr "name" }}'
```

```
# in separate terminal
export NOMAD_ADDR=http://localhost:4646
nomad node status
http://localhost:4646/ui
```