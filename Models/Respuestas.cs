namespace TP7_QQSM.Models
{
    public class Respuestas
    {
        private int _idRespuestas;
        private int _idPregunta;
        private char _opcionRespuesta;
        private string _textoRespuesta;
        private bool _correcta;

        public Respuestas(int idRespuestas, int idPregunta, char opcionRespuesta, string textoRespuesta, bool correcta)
        {
            _idRespuestas = 0;
            _idPregunta = 0;
            _opcionRespuesta = ' ';
            _textoRespuesta = null;
            _correcta = false;
        }

        public Respuestas()
        {

        }

        public int idRespuestas
        {
            get {return _idRespuestas;}
            set {_idRespuestas = value;}
        }
        public int idPregunta
        {
            get {return _idPregunta;}
            set {_idPregunta = value;}
        }
        public char opcionRespuesta
        {
            get {return _opcionRespuesta;}
            set {_opcionRespuesta = value;}
        }
        public string textoRespuesta
        {
            get {return _textoRespuesta;}
            set {_textoRespuesta = value;}
        }
        public bool correcta
        {
            get {return _correcta;}
            set {_correcta = value;}
        }
    }
}