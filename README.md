# README

Esta pequeña aplicación usa ActionCable para mostrar en pantalla el contenido de un JSON generado por un webhook 

```
bundle install
rails s
```

### Uso

1. Entrar a la aplicación https://webhooklog.herokuapp.com
2. La url generada es donde se espera el POST del webhook y debe ser configurada en el origen: Ejemplo Jira

![Configuracion](https://cloud.githubusercontent.com/assets/445798/20969212/c3052a48-bc66-11e6-8907-311e3dd1c7fa.png)


3. Una vez que el webhook se invoque (al mover la tarjeta en este caso), el JSON se visualizará en su browser 

![Ejemplo Jira](https://cloud.githubusercontent.com/assets/445798/20969216/ce46b4da-bc66-11e6-8fb4-989804a2e8f3.png)
