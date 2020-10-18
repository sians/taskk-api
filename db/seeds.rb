sian = User.create(email: 'sian.m.stone@gmail.com', password: 'foobar', first_name: 'Siân')

default_colortheme = Colortheme.create(
  primary_color: "#000",
  secondary_color: "#fff",
  tertiary_color: "#C4C4C4",
  name: "Default",
)

pink_colortheme = Colortheme.create(
  primary_color: "#FE5454",
  secondary_color: "#FFB9B2",
  tertiary_color: "#FF8B8E",
  name: "Default",
)

today = Panel.create(title: "today", colortheme: default_colortheme, user: sian)
soon = Panel.create(title: "soon", colortheme: pink_colortheme, user: sian)
someday = Panel.create(title: "someday", colortheme: default_colortheme, user: sian)


tasks = [
    {
        title: "buy unicorn",
        complete: false,
        archived: false,
        panel: someday,
        user: sian
    },
    {
        title: "buy walnuts for making banana bread",
        complete: false,
        archived: false,
        panel: today,
        user: sian
    },
    {
        title: "get form for nif",
        complete: false,
        archived: false,
        panel: soon,
        user: sian
    },
    {
        title: "learnt more react",
        complete: false,
        archived: false,
        panel: soon,
        user: sian
    },
    {
        title: "order thermos & check it can be delivered to second home",
        complete: false,
        archived: false,
        panel: today,
        user: sian
    },
    {
        title: "go to antarctica",
        complete: false,
        archived: false,
        panel: someday,
        user: sian
    },
]

tasks.each do |task|
  Task.create(task)
end
