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

    public static class JuegoQQSM
    {
        private static string _connectionString = @"Server = A-LUM-08; DataBase=Qatar22;Trusted_Connection=True;";
        private static int _preguntaActual;
        private static char _respuestaCorrectaActual;
        private static int _posicionPozo;
        private static int _pozoAcumuladoSeguro;
        private static int _pozoAcumulado;
        private static bool _comodin5050, _comodinDobleChance, _comodinSaltearPregunta;
        private static List<Pozo> _listaPozo = new List<Pozo>();
        private static List<Respuestas> _listaRespuestas = new List<Respuestas>();
        private static List<int> _listaPregsRespondidas = new List<int>();
        private static Jugadores _player;

        public static void iniciarJuego(string Nombre)
        {
            DateTime FechaHora = DateTime.Now;
            _preguntaActual = 0;
            _respuestaCorrectaActual = '\0';//es un null más fachero hecho por alberinfohdyoutube//;
            _posicionPozo = 0;
            _pozoAcumuladoSeguro = 0;
            _pozoAcumulado = 0;
            _comodin5050 = true;
            _comodinDobleChance = true;
            _comodinSaltearPregunta = true;
            List<Pozo> _listaPozo = new List<Pozo>();
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

            string sql = "INSERT INTO Jugadores(nombre, fechaHora, pozoGanado, comodinDobleChance, comodin50, comodinSaltear) VALUES(@_nombre, @_fechaHora, @_pozoGanado, @_comodinDobleChance, @_comodin50, @_comdinSaltear)";

            using (SqlConnection db = new SqlConnection(_connectionString))
            {
                db.Execute(sql, new { @_nombre = Nombre, @_fechaHora = FechaHora, @_pozoGanado = 0, @_comodinDobleChance = true, @_comodin50 = true, @_comodinSaltear = true });
            }
            _player = DevolverJugador();
        }

        public static Pregunta obtenerProximaPregunta()
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

        public static List<Respuestas> ObtenerRespuestas()
        {
            using (SqlConnection db = new SqlConnection(_connectionString))
            {
                string sql = "SELECT textoRespuesta from Respuestas where idPregunta = @_preguntaActual";
                _listaRespuestas = db.Query<Respuestas>(sql, new { pRespuestaCorrectaActual = _respuestaCorrectaActual }).ToList();
            }
            return _listaRespuestas;
        }

        public static bool RespuestaUsuario(char Opcion, char OpcionComodin = ' ')
        {
            bool acerto = false;
            if (Opcion != null && OpcionComodin != null)
            {
                string sql = "UDPATE Jugadores SET comodinDobleChance = false WHERE idJugador = @_idJugador";
                db.Execute(sql, new { @_idJugador = _player.idJugador });
            }
            if (Opcion == _respuestaCorrectaActual)
            {
                if (_listaPozo[_posicionPozo].valorSeguro == true)
                {
                    _pozoAcumuladoSeguro = _listaPozo[_posicionPozo].importe;
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

                int i = 0;
                int pos = -1;
                while (i < _listaRespuestas.Count && pos == -1)
                {
                    if (_listaRespuestas[i].correcta == true)
                    {
                        pos = i;
                    }
                    else
                    {
                        i++;
                    }

                }
            }
            else return ' ';


        }

        public static void SaltearPregunta()
        {
            int preguntaRandom = Random.Next(Pregunta.Count);
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
            using (SqlConnection db = new SqlConnection(_connectionString))
            {
                string sql = "SELECT TOP 1 * FROM Jugadores ORDER BY IdJugador DESC";
                db.QueryFirstOrDefault(sql);
            }
            return _player;
        }

























    }
















}