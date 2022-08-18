namespace TP7_QQSM.Models
{
    public class Jugadores
    {
        private int _idJugador;
        private string _nombre;
        private DateTime _fechaHora;
        private int _pozoGanado;
        private bool _comodinDobleChance;
        private bool _comodin50;
        private bool _comodinSaltear;
        public Jugadores(int idJugador, string nombre, DateTime fechaHora, int pozoGanado, bool comodinDobleChance, bool comodin50, bool comodinSaltear)
        {
            _idJugador = 0;
            _nombre = null;
            _fechaHora = DateTime.Now;
            _pozoGanado = 0;
            _comodinDobleChance = false;
            _comodin50 = false;
            _comodinSaltear = false;
        }

        public Jugadores()
        {

        }

        public int idJugador
        {
            get { return _idJugador; }
            set { _idJugador = value; }
        }
        public string NOMBRE
        {
            get { return _nombre; }
            set { _nombre = value; }
        }
        public DateTime fechaHora
        {
            get { return _fechaHora; }
            set { _fechaHora = value; }
        }
        public int pozoGanado
        {
            get {return _pozoGanado;}
            set {_pozoGanado = value;}
        }
        public bool comodinDobleChance
        {
            get {return _comodinDobleChance;}
            set {_comodinDobleChance = value;}
        }
        public bool comodin50
        {
            get {return _comodin50;}
            set {_comodin50 = value;}
        }
        public bool comodinSaltear
        {
            get {return _comodinSaltear;}
            set {_comodinSaltear = value;}
        }
    }
}