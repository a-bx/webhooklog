# README

Esta pequeña aplicación usa ActionCable para mostrar en pantalla el contenido de un JSON generado por un webhook 

```
bundle install
rails s
```

### Uso

1. Entrar a la aplicación https://webhooklog.herokuapp.com
2. La url generada es donde se espera el POST del webhook y debe ser configurada en el origen: Ejemplo Jira

![Screen Shot 2016-12-06 at 11.19.32 AM.png](https://bitbucket.org/repo/6EpM6e/images/1184122945-Screen%20Shot%202016-12-06%20at%2011.19.32%20AM.png)

3. Una vez que el webhook se invoque (al mover la tarjeta en este caso), el JSON se visualizará en su browser 

![Ejemplo Jira](https://bitbucket.org/repo/6EpM6e/images/866577341-Screen%20Shot%202016-12-06%20at%2011.23.50%20AM.png)
