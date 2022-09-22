﻿using System;

namespace TodoList.Business.Models
{
    public class TodoItem
    {
        public Guid Id { get; set; }
        public string Description { get; set; }

        public bool IsCompleted { get; set; } = false;
    }
}
