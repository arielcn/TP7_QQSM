namespace TP7_QQSM.Models
{


    public class Pozo
    {
        public int _importe;
        public bool _valorSeguro;

        public Pozo(int importe, bool valorSeguro)
        {
            _importe = importe;
            _valorSeguro = valorSeguro;
        }
        public int importe
        {
            get {return _importe;}
            set {_importe = value;}
        }
        public bool valorSeguro
        {
            get {return _valorSeguro;}
            set {_valorSeguro = value;}

        }

    }


































}