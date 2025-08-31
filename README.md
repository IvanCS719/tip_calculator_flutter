# Calculadora de Propinas
Una aplicación Flutter para calcular el monto total a pagar en una cuenta, incluyendo la propina y la opción de dividir el total entre varias personas.

## Descripción
Esta app permite:
- Ingresar el monto total de la cuenta.
- Seleccionar el porcentaje de propina mediante un slider o botones rápidos.
- Dividir el total entre varias personas.
- Ver el resultado detallado: total con propina, total por persona y monto de la propina.
- Cambiar entre tema **claro** y **oscuro** de forma dinámica.

## Características principales
- **StatefulWidget** para manejar el estado del slider, botones y resultados.
- **TextEditingController** y **FocusNode** para el campo de texto del monto.
- **Scaffold**, **AppBar** y **FloatingActionButton** para la estructura principal.
- Uso de **Column**, **Padding**, **Expanded** y otros widgets de diseño.
- **Tema personalizable** con cambio entre modo claro/oscuro y selección de color principal.
- Cálculo automático y validación de datos.

## Capturas de pantalla

- **Pantalla principal**

![PantallaPrincipal](https://i.postimg.cc/LX7LKwYr/pantalla-Principal.png)
 
- **Selección de propina**

![SeleccionDePropina](https://i.postimg.cc/zB9RgHry/selec-Propina.png)

- **División de cuenta**

![DivisionDeCuenta](https://i.postimg.cc/prbpTNf8/dividir-Cuenta.png)

- **Cambio de tema**

![CambioDeTema](https://i.postimg.cc/PrHCnjrn/temaApp.png)

## Instalación
1. Clona el repositorio:
	```bash
	git clone [https://github.com/IvanCS719/tip_calculator_flutter.git](https://github.com/IvanCS719/tip_calculator_flutter.git)
	cd tip_calculator_flutter
	```
2. Instala las dependencias:
	```bash
	flutter pub get
	```
3. Ejecuta la app:
	```bash
	flutter run
	```

## Uso
1. Ingresa el monto total de la cuenta.
2. Selecciona el porcentaje de propina usando el slider o los botones.
3. Ajusta el número de personas para dividir la cuenta.
4. Cambia entre modo **claro** y **oscuro** desde la configuración o el botón de tema.
5. Visualiza el resultado en la tarjeta principal.

## Estructura del proyecto
- `lib/`  
  - `presentation/` - Pantallas y widgets de la interfaz.
  - `domain/` - Lógica de negocio y entidades.
  - `utils/` - Funciones utilitarias.
  - `config/` - Temas y configuración.

## Temas aplicados
- Manejo de estado con StatefulWidget.
- Control de campos de texto con TextEditingController y FocusNode.
- Widgets de Material Design.
- Validación y formateo de datos.
- **Personalización de tema con cambio claro/oscuro.**

## Notas
- Esta aplicación fue desarrollada como práctica de Flutter, aplicando los conceptos básicos aprendidos.
- El manejo de estado se realiza únicamente con **setState**, sin gestores de estado avanzados.
- Es una app sencilla pero funcional, ideal para reforzar fundamentos de Flutter y la personalización de temas.
- Futuras mejoras podrían incluir: integración de un gestor de estado (Provider, Riverpod, Bloc), internacionalización y persistencia de datos.

## Author
- GitHub [@IvanDroid](https://github.com/IvanCS719)
