using System.Runtime.InteropServices.ComTypes;
using System.IO.Compression;
using System.Security.Cryptography;
using System;
using System.Data;
using System.Data.Common;
using System.Collections.Generic;
using System.Linq;
using System.Data.SqlClient;
using Dapper;

namespace TP7_QQSM.Models
{

    public class JuegoQQSM
    {
        private static string _connectionString = @"Server = A-LUM-08; DataBase=Qatar22;Trusted_Connection=True;";
        private int _preguntaActual;
        private char _respuestaCorrectaActual;
        private int _posicionPozo;
        private int _pozoAcumuladoSeguro;
        private int _pozoAcumulado;
        private bool _comodin5050, _comodinDobleChance, _comodinSaltearPregunta;
        private List<Pozo> _listaPozo = new List<Pozo>();
        private Jugadores _player;

        public void iniciarJuego(string Nombre)
        {
            _preguntaActual = 0;
            _respuestaCorrectaActual = '\0';//es un null más fachero hecho por alberinfohdyoutube//;
            _posicionPozo = 0;
            _pozoAcumuladoSeguro = 0;
            _pozoAcumulado = 0;
            _comodin5050 = true;
            _comodinDobleChance = true;
            _comodinSaltearPregunta = true;
            List<Pozo> _listaPozo = new List<Pozo>();
            List<Respondidas> _listaPregsRespondidas = new List<Respondidas>();
            _listaPozo.Add(new Pozo(2000, false));
            _listaPozo.Add(new Pozo(5000, false));
            _listaPozo.Add(new Pozo(10000, false));
            _listaPozo.Add(new Pozo(20000, false));
            _listaPozo.Add(new Pozo(30000, true));
            _listaPozo.Add(new Pozo(50000, false));
            _listaPozo.Add(new Pozo(70000, false));
            _listaPozo.Add(new Pozo(100000, false));
            _listaPozo.Add(new Pozo(130000, false));
            _listaPozo.Add(new Pozo(180000, true));
            _listaPozo.Add(new Pozo(300000, false));
            _listaPozo.Add(new Pozo(500000, false));
            _listaPozo.Add(new Pozo(750000, false));
            _listaPozo.Add(new Pozo(1000000, false));
            _listaPozo.Add(new Pozo(2000000, true));
            _player = new Jugadores(0, _respuestaCorrectaActual, _posicionPozo, _pozoAcumulado, _comodin5050, _comodinDobleChance, _comodinSaltearPregunta);

            string sql = "INSERT INTO Jugadores(nombre, fechaHora, pozoGanado, comodinDobleChance, comodin50, comodinSaltear) VALUES(@_nombre, @_fechaHora, @_pozoGanado, @_comodinDobleChance, @_comodin50, @_comdinSaltear)";

            using (SqlConnection db = new SqlConnection(_connectionString))
            {
                db.execute(sql, new { _nombre = _player.nombre, _fechaHora = _player.fechaHora, _pozoGanado = _player.pozoGanado, _comodinDobleChance = _player.comidinDobleChance, _comodin50 = _player.comodin50, _comodinSaltear = _player.comodinSaltear });
            }
            return _player;
        }

        public Pregunta obtenerProximaPregunta()
        {
            _preguntaActual++;
            Pregunta preguntaActual = null;
            using (SqlConnection db = new SqlConnection(_connectionString))
            {
                string sql = "SELECT * FROM Preguntas WHERE idPregunta = @pPreguntaActual";
                preguntaActual = db.QueryFirstOrDefault(sql, new { pPreguntaActual = _preguntaActual });
            }
            return preguntaActual;
        }

        public List<Respuestas> ObtenerRespuestas()
        {
            List<Respuesta> ListaRespuestas = new List<Respuesta>();
            using (SqlConnection db = new SqlConnection(_connectionString))
            {
                string sql = "SELECT textoRespuesta from Respuestas where idPregunta = @_preguntaActual";
                ListaRespuestas = db.Query<Respuestas>(sql, new { pRespuestaCorrectaActual = _respuestaCorrectaActual }).ToList();
            }
            return ListaRespuestas;
        }

        public bool RespuestaUsuario(char Opcion, char OpcionComodin = ' ')
        {
            bool acerto = false;
            if (Opcion != null && OpcionComodin != null)
            {
                string sql = "UDPATE Jugadores SET comodinDobleChance = false WHERE idJugador = @_idJugador";
                db.execute;
            }
            if (Opcion == _respuestaCorrectaActual)
            {
                if (_listaPozo[_posicionPozo].valorSeguro == true)
                {
                    _pozoAcumuladoSeguro == _listaPozo[_posicionPozo].importe;
                }
                _posicionPozo++;

                acerto = true;
            }
            return acerto;
        }

        public static List<Pozo> listarPozo()
        {
            return _listaPozo;
        }

        public static int DevolverPosicionPozo(int _posicionPozo)
        {
            return _posicionPozo;
        }

        public static char Descartar50()
        {
            if (_player.comodin50 == true)
            {
                string sql = "UDPATE Jugadores SET comodin50 = false WHERE idJugador = @_idJugador";
            }
            int i = 0;
            int pos = -1;
            while(i < _ListaRespuestas[i].Count == true && pos == -1)
            {
                if(_ListaRespuestas[i]._correcta == true)
                {
                    pos = i;
                }
                else
                {
                    i++;
                }

            }


        }

        public static void SaltearPregunta()
        {
            int preguntaRandom = Random.next(Pregunta.Count);
            if (_player._comodinSaltearPregunta == true)
            {
                _listaPregsRespondidas.Add(preguntaActual);
                using (SqlConnection db = new SqlConnection(_connectionString))
                {
                    string sql = "UPDATE Jugadores SET comodin50 = false WHERE idJugador = @_idJugador";
                    db.execute(sql, new { @idJugador = _player.idJugador });
                }
                preguntaActual = preguntaRandom; //verificar, dudoso//
            }


        }

        public static Jugadores DevolverJugador()
        {
            if (_pozoAcumulado == 200000 || _correcta == false)
            {
                return _player;
            }
        }

























    }
















}