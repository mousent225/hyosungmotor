﻿using System;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Text.RegularExpressions;
using System.Web;

namespace HyosungMotor.Utilities
{
    public class Util
    {
        public static string ToUnsignString(string input)
        {
            input = input.Trim();
            for (int i = 0x20; i < 0x30; i++)
            {
                input = input.Replace(((char)i).ToString(), " ");
            }
            input = input.Replace(".", "-");
            input = input.Replace(" ", "-");
            input = input.Replace(",", "-");
            input = input.Replace(";", "-");
            input = input.Replace(":", "-");
            input = input.Replace("  ", "-");
            Regex regex = new Regex(@"\p{IsCombiningDiacriticalMarks}+");
            string str = input.Normalize(NormalizationForm.FormD);
            string str2 = regex.Replace(str, string.Empty).Replace('đ', 'd').Replace('Đ', 'D');
            while (str2.IndexOf("?") >= 0)
            {
                str2 = str2.Remove(str2.IndexOf("?"), 1);
            }
            while (str2.Contains("--"))
            {
                str2 = str2.Replace("--", "-").ToLower();
            }
            return str2;
        }

        public static string RemoveSign4VietnameseString(string str)
        {
            for (int i = 1; i < ApplicationStatic.vietnameseSigns.Length; i++)
            {
                for (int j = 0; j < ApplicationStatic.vietnameseSigns[i].Length; j++)
                    str = str.Replace(ApplicationStatic.vietnameseSigns[i][j], ApplicationStatic.vietnameseSigns[0][i - 1]);
            }
            return str;
        }

        public static string Encrypt(string plainText)
        {
            byte[] inputByte = Encoding.UTF8.GetBytes(plainText);
            return Convert.ToBase64String(inputByte.ToArray());
        }

        public static string Decrypt(string encryptedText)
        {
            byte[] inputByte = new byte[encryptedText.Length];
            inputByte = Convert.FromBase64String(encryptedText);
            return HttpUtility.HtmlDecode(Encoding.UTF8.GetString(inputByte.ToArray()));
        }

        public static string FormatNumber(int number)
        {
            var str1 = number.ToString();
            var str2 = "";
            for (; str1.Length > 3; str1 = str1.Substring(0, str1.Length - 3))
                str2 = "," + str1.Substring(str1.Length - 3) + str2;
            return str1 + str2;
        }

        public static string FormatNumber(string number)
        {
            var str1 = number;
            var str2 = "";
            for (; str1.Length > 3; str1 = str1.Substring(0, str1.Length - 3))
                str2 = "," + str1.Substring(str1.Length - 3) + str2;
            return str1 + str2;
        }

        public static byte[] ImageToByteArray(System.Drawing.Image imageIn)
        {
            MemoryStream ms = new MemoryStream();
            imageIn.Save(ms, System.Drawing.Imaging.ImageFormat.Gif);
            return ms.ToArray();
        }

        public static Image ByteArrayToImage(byte[] byteArrayIn)
        {
            MemoryStream ms = new MemoryStream(byteArrayIn);
            Image returnImage = Image.FromStream(ms);
            return returnImage;
        }

        public static int IP2INT(string IP)
        {
            return BitConverter.ToInt32(IPAddress.Parse(IP).GetAddressBytes().Reverse().ToArray(), 0);
            //return BitConverter.ToInt32(IPAddress.Parse(IP).GetAddressBytes(), 0);
        }

        public static string INT2IP(int IntIP)
        {
            return new IPAddress(BitConverter.GetBytes(IntIP).Reverse().ToArray()).ToString();
            //return new IPAddress(BitConverter.GetBytes(IntIP)).ToString();
        }

        public static string ScaleImage(object img)
        {
            try
            {
                System.Drawing.Image _image = System.Drawing.Image.FromStream(new System.IO.MemoryStream((byte[])img));
                System.Drawing.Image _newimage = _image.GetThumbnailImage(150, 180, null, new System.IntPtr());

                byte[] buffer;
                MemoryStream stream = new MemoryStream();
                _newimage.Save(stream, System.Drawing.Imaging.ImageFormat.Png);

                buffer = stream.ToArray();

                return buffer == (object)DBNull.Value ? "" : BitConverter.ToString((Byte[])buffer).Replace("-", string.Empty);
            }
            catch (Exception)
            {
                return "";
            }
        }
    }
}