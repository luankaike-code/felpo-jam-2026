
# **Coding Roadmap**

A roadmap to the programmers

## **File structure logic**

```files

.
|-- assets               # only files not .tsnc and .gd
|   |-- sounds 
|   |-- sprites
|   |-- translates
|   |-- tiles            # only .tres
|-- scenes               # only .tsnc
|   |-- entitys          # Things with collisions/moviment
|   |   |-- player.tsnc
|   |-- huds
|   |-- screens          # Only Screen
|   `-- camera.tscn      # file very specific
|-- scripts              # only .gd
|   |-- data             # static classes with information/relation
|   |-- entitys
|   |   |-- player       # if scene has various scripts
|   |   |   |-- i_area.gd
|   |   |   |-- player.gd
|   |   |-- altar.gd
|   |-- ...
|   |-- state_machine    # basic StateMachines and States
|   |-- states           # specific states
|   |   |-- player       # if scene has various states
|   |       |-- dash.gd
|   |       |-- idle.gd
|   |       |-- move.gd
|   |-- camera.gd
`-- project.godot


```

## **Screen structure**

Content: popup and screen

### Data

- **ScreensData: Resource**
  - enums name
  - var packed: Dictionary[names, PackedScene]

### PopUp

- **PopUpMensage: Resource**
  - *A template class to typate. Is work how EventInput into _input*
- **PopUpMensageOpenPopUp: PopUpMensage**
  - setup(popup_scene_: PackedScane) -> void
  - var popup_scene: PackedScane
- **PopUpMensagePause: PopUpMensage**
  - setup(pause_: bool) -> void
  - var pause: bool
- **PopUp: Node2D**
  - signal send_mensage(mensage: PopUpMensage)

### Screen

- **ScreenTransition**
  - signal finish_exit_transition
  - signal finish_enter_transition
  - enum transition_direction { EXIT, ENTER }
  - func start_transition(transition: transition)
- **RootGame: Node**
  - *ScreenTransition as child*
  - var current_screen: Screen
  - func changeScreen(screen_name: ScreensData.name) -> void
- **Screen: Node2D**
  - signal ChangeScreen
- **ScreenWithPopUp: Screen**
  - func _pop_up_mensage(mensage: PopUpMensage)
    - *this work will how a _input*
  - func factory_pop_up(pop_scene: PopUp)
    - *connect _pop_up_mensage in pop_scene.send_mensage*
    - *add pop_scene how child*
