# biblioteca_mejorada

## Analogía de Clean Architecture en mi mente

# Capa Domain
domain (capa de los fifís/poderosos que no se ensucian las manos para traer información)  
- **domain/entities** → las clases con sus atributos y constructores.  
- **domain/repositories** → una persona que tiene contratos para obtener un CRUD (update, getById, etc).  
  Él conoce a personas de trabajo sucio que saben conseguir información (**data/repositories**).  
- **domain/usecase** → Los casos que se usarán o la información que se necesita.  
  Conoce a una persona que puede traer información (contratos).  
  El caso de uso solo recibe y da lo que necesita: id, entidades, etc.  

---

# Capa Data
- **data/modelos** → una clase que hereda de entities y las convierte de JSON a modelo y de modelo a JSON para enviar al backend.  
- **data/repositories** → Es una persona de abajo que no se ensucia tanto las manos, pero trae cosas sucias.  
  También tiene contratos. Conoce a alguien de la alta sociedad que necesita información y lo contacta,  
  y le proporciona un CRUD (id, datos_nuevos).  
  Este **data/repositories** conoce a una persona que se encarga de investigar los datos que le proporcionaron,  
  pero no sabe cómo lo hace, solo sabe que los consigue. Por eso conoce a **data/datasource**.  
- **data/datasource** → Es el mañoso que consigue cierta información requerida, información sucia o privada,  
  por medio de una API. Esa API le devuelve un resultado y se lo pasa a **data/repositories**,  
  el que sabe conseguir información sin mancharse tanto las manos.  
  Después se lo pasa a **domain/repositories**, que es el fifi/poderoso que no se ensucia las manos,  
  pero necesitaba la información.  

---

# Capa Presentación
- **Provider** → Tiene todos los **domain/usecase**, sabe las cosas que se pueden conseguir.  
  Es una persona de más alta sociedad que domain (jajaja).  
  Solo se puede comunicar con Entities, no se junta con la chusma para conseguir información.  
  Crea una lista ficticia que refleja en la sociedad/UI.  
  Solo obtendrá o manejará la información que le fue proporcionada por **domain/usecase**,  
  que fue investigada o conseguida por **data/datasource** / API.  
-***UI** → Es como el teatro donde se presenta todo bonito. No sabe nada de cómo se consiguió la info, solo recibe y muestra.